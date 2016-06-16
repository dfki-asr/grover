/**
 * 
 */
package de.dfki.resc28.grover.service;

import javax.ws.rs.core.Response;

/**
 * @author resc01
 *
 */
public interface IBaseService 
{
	/**
	 * Generate source code for user-specified targetAPI for user-specified vocabulary retrievable from vocabURI
	 * @param targetAPI
	 * @param vocabUri
	 * @return
	 */
	public Response generateSource(String targetAPI, String vocabUri);
}
