/*
 * This file is part of IGraphStore. It is subject to the license terms in
 * the LICENSE file found in the top-level directory of this distribution.
 * You may not use this file except in compliance with the License.
 */
package de.dfki.resc28.grover.generator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.jena.rdf.model.InfModel;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.ResIterator;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.reasoner.ValidityReport;
import org.apache.jena.vocabulary.OWL;
import org.apache.jena.vocabulary.RDF;
import org.apache.jena.vocabulary.RDFS;
import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;
import org.stringtemplate.v4.STGroupFile;


/**
 * @author resc01
 *
 */
public class Generator implements IGenerator
{
	public Generator(String templateBaseDir, String targetAPI, Model vocabModel)
	{
		m_templatePath = templateBaseDir + "/" + targetAPI + ".stg";
		m_templateGroup = new STGroupFile(m_templatePath);
		m_vocabModel = vocabModel;
	}
	
	
	/**
	 *	TODO: refactor! 
	 */
	@SuppressWarnings("restriction")
	public String generateSource() 
	{
		m_sourceTemplate = m_templateGroup.getInstanceOf("VOCAB");
		
		// get baseURI and prefix
		// FIXME: ntriples has no notion of prefixes!!
		ResIterator ontIter = m_vocabModel.listResourcesWithProperty(RDF.type, OWL.Ontology);
		while (ontIter.hasNext())
		{
			Resource ont = ontIter.next();
			m_nsURI = ont.getURI() ;
			
			Map<String,String> pfxMap = m_vocabModel.getNsPrefixMap();
			for (Map.Entry<String,String> entry : pfxMap.entrySet())
			{
				if (entry.getValue().contains(m_nsURI))
				{
					m_vocabName = entry.getKey().toUpperCase() ;
//					m_nsURI = entry.getValue();
				}
			}
		}
		
		addVocabularyName();
		addVocabularyNamespace();

		InfModel m_inferedVocabModel = ModelFactory.createRDFSModel(m_vocabModel);
		ValidityReport validity = m_inferedVocabModel.validate();
		
		if (validity.isValid())
		{
			// TODO: make support RDFS reasoning optional
			// TODO: CamelCase to underscore
		    ResIterator iterClasses = m_inferedVocabModel.listResourcesWithProperty(RDF.type, RDFS.Class);
		    List<String> localClassNames = new ArrayList<String>();
		    while (iterClasses.hasNext())
		    {
		    	Resource c = iterClasses.next();
		    	if (c.getURI().contains(m_nsURI))
		    		if (javax.lang.model.SourceVersion.isName(c.getLocalName()))
		    				localClassNames.add(c.getLocalName());
		    		else
		    			localClassNames.add(c.getLocalName() + "_");
		    }
		    m_sourceTemplate.add("localClassNames", localClassNames);
		
		    // TODO: make support RDFS reasoning optional
			// TODO: CamelCase to underscore
		    ResIterator iterProperties = m_inferedVocabModel.listResourcesWithProperty(RDF.type, RDF.Property);
		    List<String> localPropertyNames = new ArrayList<String>();
		    while (iterProperties.hasNext())
		    {
		    	Resource p = iterProperties.next();
		    	if (p.getURI().contains(m_nsURI))
		    		if (javax.lang.model.SourceVersion.isName(p.getLocalName()))
		    			localPropertyNames.add(p.getLocalName());
		    		else
		    			localPropertyNames.add(p.getLocalName() + "_");
		    }
		    
		    // TODO: support for RDF(S) instances
		    	
		    m_sourceTemplate.add("localPropertyNames", localPropertyNames);			
		}
		
		return m_sourceTemplate.render();
	}

	

	private void addVocabularyNamespace() 
	{
		m_sourceTemplate .add("namespaceUri", m_nsURI);
	}

	private void addVocabularyName() 
	{
		m_sourceTemplate .add("vocabName", m_vocabName);
	}

	
	private Model m_vocabModel = null;
	private String m_templatePath = null;
	private STGroup m_templateGroup = null;
	private ST m_sourceTemplate = null;
	private String m_nsURI = null;
	private String m_vocabName = null;
}
