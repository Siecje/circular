import tables
import asynchttpserver, asyncdispatch
#import circular
import index

proc home():string {.procvar.}  =
# return circular.render("index.html")
  return index.render("test")

# circular.routes = {"/": index}.toTable()
var routes = {"/": home}.toTable()

# circular.run()

var server = newAsyncHttpServer()

proc cb(req: Request) {.async.} =
  echo($req.url.path)
  var result2 = routes[$req.url.path]()
  # await req.respond(Http200, "test")
  await req.respond(Http200, result2)

asyncCheck server.serve(Port(8080), cb)
runForever()
