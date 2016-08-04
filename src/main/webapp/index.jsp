
<!DOCTYPE html>

<!-- This file is part of Grover. It is subject to the license terms in
     the LICENSE file found in the top-level directory of this distribution.
     You may not use this file except in compliance with the License. -->

<html lang="en">
<head>
    <title>Grover</title>
    <meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://codemirror.net/lib/codemirror.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://codemirror.net/lib/codemirror.js"></script>
    <script src="https://codemirror.net/mode/clike/clike.js"></script>
    <script src="https://codemirror.net/addon/display/autorefresh.js"></script>
    <script src="http://www.appelsiini.net/projects/chained/jquery.chained.min.js"></script>
    
<style type="text/css">
    html, body {
        height: 100%;
        margin: 0px;
    }
    .nav {
        /* background: #e3d235; */
    }
    .panel-body {
        height: 100%;
        /* background: #f0e68c; */
    }
    .CodeMirror {
        border: 1px solid #eee;
        height: auto;
    }
    .outerPanel {
        padding-top: 10px;
        padding-right: 10px;
        padding-bottom: 10px;
        padding-left: 10px;
        background: #f2f2f2
    }

</style>    
</head>
    
<body>
        
<div class="container">
    <br/>
    <div class="panel panel-default outerPanel">
    <div class="panel panel-default">
        <div class="panel-body">
            <p><b>Grover</b> is a polyglot schema generator and happily serves source code files that contain static constants for the terms in a given RDFS or OWL vocabulary.</p>
        </div>
    </div>
    
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">Input by URI</a></li>
        <li><a data-toggle="tab" href="#menu1">Input by text</a></li>
<!--        <li><a data-toggle="tab" href="#menu2">Advanced Configuration</a></li> -->
        <li><a data-toggle="tab" href="#menu3">Output</a></li>
        <li><a data-toggle="tab" href="#menu4">About</a></li>
    </ul>

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <br/>
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
                                    <select id="targetLanguageByURI" name="targetLanguage" class="form-control">
                                        <option value="">--</option>
                                        <option value="java">Java</option>
                                        <option value="csharp">C#</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="targetFramework">RDF Framework</label>
                                <div class="col-md-10">
                                    <select id="targetFrameworkByURI" name="targetFramework" class="form-control">
                                        <option value="">--</option>
                                        <option value="jena" class="java">Jena</option>
                                        <option value="rdf4j" class="java">RDF4J</option>
                                        <option value="dotNetRDF" class="csharp">dotNetRDF</option>
                                        <option value="rdfSharp" class="csharp">RDFSharp</option>
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
                                    <select id="targetLanguageByText" name="targetLanguage" class="form-control">
                                        <option value="">--</option>
                                        <option value="java">Java</option>
                                        <option value="csharp">C#</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="targetFramework">RDF Framework</label>
                                <div class="col-md-10">
                                    <select id="targetFrameworkByText" name="targetFramework" class="form-control">
                                        <option value="">--</option>
                                        <option value="jena" class="java">Jena</option>
                                        <option value="rdf4j" class="java">RDF4J</option>
                                        <option value="dotNetRDF" class="csharp">dotNetRDF</option>
                                        <option value="rdfSharp" class="csharp">RDFSharp</option>
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
                        <textarea id="editor" name="editor"></textarea>
                    </form>
                </div>
                    
                <div id="menu4" class="tab-pane fade">
                    <h3>What does Grover do?</h3>
                    <p>Grover generates and serves source code files that contain static constants for the terms in a given RDFS or OWL vocabulary.</p>
                    <p>Grover is very similar to <a href="https://jena.apache.org/documentation/tools/schemagen.html">Jena's schemagen CLI tool</a>, but comes as a REST service.</p>
                    <p>We plan to extend Grover for catering more target languages and RDF frameworks.</p>
                    <h3>Get your own Grover!</h3>
                    <p>The source code of this tool is available from <a href="https://github.com/rmrschub/grover">GitHub</a>.
                </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <p>This work has been supported by the <a href="http://www.bmbf.de/en/index.html">German Ministry for Education and Research (BMBF)</a> as part of the <a href="http://www.arvida.de/">ARVIDA project.</a></p>
            </div>
        </div>
    </div>    
</div>
    
<script type="text/javascript">
    $("#targetFrameworkByURI").chainedTo($("#targetLanguageByURI"));
    $("#targetFrameworkByText").chainedTo($("#targetLanguageByText"));
</script>

    
    
<script type="text/javascript">
    var editor = CodeMirror.fromTextArea(document.getElementById("editor"), {
        viewportMargin: Infinity,
        readOnly: true,
        styleActiveLine: true,
        mode: "text/x-java",
        autoRefresh: true
    });
    $('#editor').data('CodeMirrorInstance', editor);
</script>
    
<script type="text/javascript">
    $("#byGET").submit(function(event) {
        event.preventDefault();
        var targetLanguage = $("select[name='targetLanguage']" , "#byGET").val(),
            targetFramework = $("select[name='targetFramework']" , "#byGET").val(),
            vocabURI = $("input[name='uri']" , "#byGET").val();
        
        $.get(
            "api/" + targetLanguage + "/" + targetFramework + "?uri=" + vocabURI,
            function(data) {
                $('.nav-tabs a[href="#menu3"]').tab('show');
                var editor = $('#editor').data('CodeMirrorInstance');
                editor.getDoc().setValue(data);
                editor.refresh();

            }
        );
        


    });
</script>

<style type='text/css'>@import url('http://getbarometer.s3.amazonaws.com/assets/barometer/css/barometer.css');</style>
<script src='http://getbarometer.s3.amazonaws.com/assets/barometer/javascripts/barometer.js' type='text/javascript'></script>
<script type="text/javascript" charset="utf-8">
  BAROMETER.load('D2D88y7fGGhLd72ahB937');
</script>        

</body>
</html>

