/*
 * This file is part of IGraphStore. It is subject to the license terms in
 * the LICENSE file found in the top-level directory of this distribution.
 * You may not use this file except in compliance with the License.
 */
package de.dfki.resc28.grover.service;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.core.UriInfo;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.riot.RDFDataMgr;

import de.dfki.resc28.grover.generator.Generator;


/**
 * @author resc01
 *
 */

@Path("/java")
public class GroverJavaService 
{
	//================================================================================
    // Request Handlers
    //================================================================================


	/**
	 * Returns a Java implementation of the RDF vocabulary
	 * @return
	 */
	@GET
	@Path("/{targetAPI:.+}")
	@Produces("text/x-java-source")
	public Response generateJavaSource( @PathParam("targetAPI") String targetAPI,
										@DefaultValue("http://d2rq.org/terms/d2rq.ttl") @QueryParam("uri") String vocabUri )
	{
		Generator sourceGenerator = null;
		String source = null;
		
//		try 
//		{
//			
//			CloseableHttpClient httpclient = HttpClients.createDefault();
//			HttpGet httpGet = new HttpGet(vocabUri);
//			CloseableHttpResponse response1;
//			response1 = httpclient.execute(httpGet);
//			HttpEntity rspEntity = response1.getEntity();
//			System.out.println(IOUtils.toString(rspEntity.getContent(), "UTF-8"));
			
			// TODO: add some error handling here!
			// create CodeGenerator
			Model vocabModel = RDFDataMgr.loadModel(vocabUri) ;
			sourceGenerator = new Generator(m_Context.getRealPath("/WEB-INF/languages/java"),
													  targetAPI,
													  vocabModel);
			// generate sources
			source = sourceGenerator.generateSource();


//			
//		} 
//		catch (ClientProtocolException e) 
//		{
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} 
//		catch (IOException e) 
//		{
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		

		
		// generate Response
		if (source == null)
			return Response.status(Status.BAD_REQUEST).build();
		else
			return Response.ok(source).build();


	}
	

	//================================================================================
    // Member variables
    //================================================================================
	
	@Context protected ServletContext m_Context;
	@Context HttpServletRequest m_Request;
	@Context protected UriInfo m_RequestUrl;
}
