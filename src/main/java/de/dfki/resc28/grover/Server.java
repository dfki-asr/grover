/*
 * This file is part of Grover. It is subject to the license terms in
 * the LICENSE file found in the top-level directory of this distribution.
 * You may not use this file except in compliance with the License.
 */
package de.dfki.resc28.grover;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

import de.dfki.resc28.grover.service.CSharpService;
import de.dfki.resc28.grover.service.JavaService;


/**
 * @author resc01
 *
 */

@ApplicationPath("/")
public class Server extends Application 
{
	@Override
	public Set<Class<?>> getClasses() 
	{
		super.getClasses();
		final Set<Class<?>> classes = new HashSet<Class<?>>();
		classes.add(JavaService.class);
		classes.add(CSharpService.class);
		return classes;
	}
}
