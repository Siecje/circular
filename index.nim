import templates
import _layout

proc render*(): string =
  return _layout.render('index', tmpli html"""
<strong>This is from the page<strong>
""")
