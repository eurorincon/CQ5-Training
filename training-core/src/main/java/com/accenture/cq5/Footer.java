package com.accenture.cq5;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.day.cq.wcm.api.Page;

public class Footer {
	List<Page> hijos;
	public List<Page> getHijos() {
		return hijos;
	}
	public void setHijos(List<Page> hijos) {
		this.hijos = hijos;
	}
	public Footer (Page currentPage){
		hijos = new ArrayList<Page>();
		        // Get the parent page using the currentPage (Page) object provided by CQ.
		        Page parent = currentPage.getParent();
		        
		        if (parent != null) {
		        
		            // Create an Iterator. listChildren() method returns an Iterator<Page>
		            Iterator<Page> children = parent.listChildren();
		            
		            // While the iterator list has a next child
		            while (children.hasNext()){
		                
		                // Get the child page. The next() method returns the next object in the collection.
		                Page child = children.next();
		                
		                // Check that we are not including the current page. Using the equals() method inherited from the java Object class 
		                if (!currentPage.equals(child)) { hijos.add(child); }
		                
		                // "Print" a DIV tag to the html
		            }
		   }
	}
}
