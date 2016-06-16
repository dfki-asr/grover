/*
 * This file is part of Grover. It is subject to the license terms in
 * the LICENSE file found in the top-level directory of this distribution.
 * You may not use this file except in compliance with the License.
 */
package de.dfki.resc28.grover.service;

import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.riot.RDFDataMgr;

import de.dfki.resc28.grover.generator.Generator;

/**
 * @author resc01
 *
 */
@Path("/csharp")
public class CSharpService extends BaseService implements IBaseService 
{
	//================================================================================
	// Request Handlers
	//================================================================================

	/**
	 * Returns a CSharp implementation of the RDF vocabulary
	 * @return
	 */
	@GET
	@Path("/{targetAPI:.+}")
	@Produces("text/x-csharp-source")
	public Response generateSource( @PathParam("targetAPI") String targetAPI,
									@DefaultValue("http://d2rq.org/terms/d2rq.ttl") @QueryParam("uri") String vocabUri ) 
	{
		Generator sourceGenerator = null;
		String source = null;
			
		// TODO: add some error handling here!
		// create CodeGenerator
		Model vocabModel = RDFDataMgr.loadModel(vocabUri) ;
		sourceGenerator = new Generator(m_Context.getRealPath("/WEB-INF/languages/csharp"),
										targetAPI,
										vocabModel);
		// generate sources
		source = sourceGenerator.generateSource();

	
		// generate Response
		if (source == null)
			return Response.status(Status.BAD_REQUEST).build();
		else
			return Response.ok(source).build();
	}
}
