coffee = require("coffeescript")

# **ddollar**
#
#     dd = require("ddollar")
module.exports =

  # **arrayify(obj)**
  #
  #     dd.arryify(null)  #=> []
  #     dd.arrayify(5)    #=> [5]
  #     dd.arrayify([5])  #=> [5]
  arrayify: (obj) ->
    return [] unless obj?
    return obj if Array.isArray(obj)
    [obj]

  # **delay(ms)**
  #
  #     dd.delay 500, ->
  #       console.log "waited 500 ms"
  delay: (ms, cb) -> setTimeout cb, ms

  # **every(ms)**
  #
  #     dd.every 500, ->
  #       console.log "another 500ms have passed"
  every: (ms, cb) -> setInterval cb, ms

  # **keys(hash)**
  #
  #     dd.keys(a:1, b:2)  #=> ["a", "b"]
  keys: (hash) -> key for key, val of hash

  # **merge(hash, hash)**
  #
  #     dd.merge({a:1, b:2}, b:3)  #=> {"a":1, "b":3}
  merge: coffee.helpers.merge

  # **now()**
  #
  #     dd.now()  #=> 1000111222333
  now: -> (new Date()).getTime()

  # **reduce()**
  #
  #     dd.reduce [1,2,3], 0, (ax, i) -> ax + i  #=> 6
  reduce: (obj, start, cb) -> obj.reduce(cb, start)

  # **values()**
  #
  #     dd.values(a:1, b:2) #=> [1, 2]
  values: (hash) -> (val for key, val of hash)
