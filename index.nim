import templates
import layout

proc render*(title: string): string =
  tmpli html"""
      <strong>This is from the page<strong>
      """
  return layout.render(title, result)
