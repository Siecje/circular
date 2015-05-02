import tables
import asynchttpserver, asyncdispatch

#proc render*(file: string):string =
#   import file
#   return file.render

var routes = {"/": "one"}.toTable()

var server = newAsyncHttpServer()

proc cb(req: Request) {.async.} =
  echo($req.url.path)
  var result2 = routes[$req.url.path]()
  # await req.respond(Http200, "test")
  await req.respond(Http200, result2)

proc run() =
  asyncCheck server.serve(Port(8080), cb)
  runForever()
