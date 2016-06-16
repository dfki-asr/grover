/*
 * This file is part of Grover. It is subject to the license terms in
 * the LICENSE file found in the top-level directory of this distribution.
 * You may not use this file except in compliance with the License.
 */
package de.dfki.resc28.grover.service;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;

/**
 * @author resc01
 *
 */
public abstract class BaseService implements IBaseService
{
	//================================================================================
	// Member variables
	//================================================================================

	@Context protected ServletContext m_Context;
	@Context HttpServletRequest m_Request;
	@Context protected UriInfo m_RequestUrl;
}
