<!DOCTYPE html>
<html lang="en">
<head>
    <title>Grover</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://codemirror.net/lib/codemirror.css">
    <script src="https://codemirror.net/lib/codemirror.js"></script>
    <script src="https://codemirror.net/mode/clike/clike.js"></script>
    
<style type="text/css">
    html, body {
        height: 100%;
        margin: 0px;
    }
    .panel-body {
        height: 100%;
        background: #f0e68c;
    }
      .CodeMirror {
        border: 1px solid #eee;
        height: auto;
      }

</style>    
</head>
    
<body>
        
<div class="container">
    
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">By URI</a></li>
        <li><a data-toggle="tab" href="#menu1">By Text</a></li>
        <li><a data-toggle="tab" href="#menu2">Advanced</a></li>
        <li><a data-toggle="tab" href="#menu3">Source Code</a></li>
    </ul>

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <br/>
                    <!--
                    <form class="form-horizontal" id="byGET" method="get" onsubmit="this.action='api/'+this.targetLanguage.value+'/'+this.targetFramework.value;this.targetLanguage.name='';this.targetFramework.name='';this.submit.name='';"> 
                    -->
                    <form class="form-horizontal" id="byGET" method="get">
                        <fieldset>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="vocabURI">Vocabulary URI</label>
                                <div class="col-md-10">
                                    <input id="vocabURI" name="uri" type="text" placeholder="http://xmlns.com/foaf/spec/index.rdf" class="form-control input-md" required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="targetLanguage">Target Language</label>
                                <div class="col-md-10">
                                    <select id="targetLanguage" name="targetLanguage" class="form-control">
                                        <option value="java">Java</option>
                                        <option value="csharp">C#</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="targetFramework">RDF Framework</label>
                                <div class="col-md-10">
                                    <select id="targetFramework" name="targetFramework" class="form-control">
                                        <option value="jena">Jena</option>
                                        <option value="rdf4j">RDF4J</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label" for="submit"></label>
                                <div class="col-md-10">
                                    <button id="submit" name="submit" class="btn btn-info">Generate Source</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            
                <div id="menu1" class="tab-pane fade">
                    <form class="form-horizontal">
                        <fieldset>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="namespacePrefix">Namespace Prefix</label>  
                                <div class="col-md-10">
                                    <input id="namespacePrefix" name="namespacePrefix" type="text" placeholder="FOAF" class="form-control input-md" required="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="namespaceURI">Namespace URI</label>  
                                <div class="col-md-10">
                                    <input id="namespaceURI" name="namespaceURI" type="text" placeholder="http://xmlns.com/foaf/0.1/" class="form-control input-md" required="">   
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="textarea">Text Area</label>
                                <div class="col-md-10">                     
                                    <textarea class="form-control" id="textarea" rows="10" name="textarea" required="" placeholder="Put your vocab here!"></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="targetLanguage">Target Language</label>
                                <div class="col-md-10">
                                    <select id="targetLanguage" name="targetLanguage" class="form-control">
                                        <option value="1">Java</option>
                                        <option value="2">C#</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="targetFramework">RDF Framework</label>
                                <div class="col-md-10">
                                    <select id="targetFramework" name="targetFramework" class="form-control">
                                        <option value="1">Jena</option>
                                        <option value="2">RDF4J</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="submit"></label>
                                <div class="col-md-10">
                                    <button id="submit" name="submit" class="btn btn-info">Generate Source</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            
                <div id="menu2" class="tab-pane fade">
                    <p>Coming soon.</p>
                </div>

                <div id="menu3" class="tab-pane fade">
                    <form>
                        <textarea id="editor" name="editor">
/**
 * This file has been automatically generated using Grover (https://github.com/rmrschub/grover).
 * It contains static constants for the terms in the D2RQ vocabulary.
 */
package de.dfki.grover.vocabularies;

import org.apache.jena.rdf.model.Property;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.rdf.model.ResourceFactory;
import org.apache.jena.shared.PrefixMapping;

public final class D2RQ 
{
  public static final String PREFIX = "D2RQ";
  public static final PrefixMapping NAMESPACE = PrefixMapping.Factory.create().setNsPrefix(PREFIX, CONSTANTS.NS);
}
                        </textarea>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    
    
<script type="text/javascript">
var editor = CodeMirror.fromTextArea(document.getElementById("editor"), {
  viewportMargin: Infinity,
  readOnly: true,
  styleActiveLine: true,
  mode: "text/x-java"
});
</script>
    
<script type="text/javascript">
    $("#byGET").submit(function(event) {
        event.preventDefault();
        var targetLanguage = $("select[name='targetLanguage']" , "#byGET").val(),
            targetFramework = $("select[name='targetFramework']" , "#byGET").val(),
            vocabURI = $("input[name='uri']" , "#byGET").val();
        
        $.get(
            "api/" + targetLanguage + "/" + targetFramework + "?" + vocabURI,
            function(data) {
                $("#editor").empty().append(data);
            }
        );
        
        $(".CodeMirror").each(function(i, el){
            el.CodeMirror.refresh();
        });

    });
</script>

        
        

</body>
</html>

