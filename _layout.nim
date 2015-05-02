import templates

proc render*(title, content: string): string = tmpli html"""
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>$title</title>
    <link rel="stylesheet" href="/styles.css">
  </head>
  <body>
    <div id="container">
      <h1>$title</h1>
      <div id="content">
        $ { content }
      </div>
    </div>
  </body>
</html>
"""
