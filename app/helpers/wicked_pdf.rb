<!doctype html>
<html>
  <head>
    <meta charset='utf-8' />
    <%= wicked_pdf_stylesheet_link_tag "pdf" -%>
    <%= wicked_pdf_javascript_include_tag "number_pages" %>
  </head>
  <body onload='number_pages'>
    <div id="header">
      <%= image_tag wicked_pdf_asset_base64('mysite.jpg') %>
    </div>
    <div id="content">
      <%= yield %>
    </div>
  </body>
</html>