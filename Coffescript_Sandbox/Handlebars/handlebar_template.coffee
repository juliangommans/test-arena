runHandlebar = ->
  templateScript = $("#animal-name-template").html();
  template = Handlebars.compile(templateScript);
  context =
    "name": $("#batman").val()
  compiledHtml = template(context)
