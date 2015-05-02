import tables
import asynchttpserver, asyncdispatch
#import circular

proc index():string {.procvar.}  =
# return circular.render("index.html")
  return "hello"

# circular.routes = {"/": index}.toTable()
var routes = {"/": index}.toTable()

# circular.run()

var server = newAsyncHttpServer()

proc cb(req: Request) {.async.} =
  echo($req.url.path)
  var result2 = routes[$req.url.path]()
  # await req.respond(Http200, "test")
  await req.respond(Http200, result2)

asyncCheck server.serve(Port(8080), cb)
runForever()
