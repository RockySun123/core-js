'use strict'
{module, test} = QUnit
module \ES6

test 'Array#find' (assert)->
  assert.ok typeof! Array::find is \Function, 'is function'
  assert.strictEqual Array::find.length, 1, 'arity is 1'
  assert.ok /native code/.test(Array::find), 'looks like native'
  assert.strictEqual Array::find.name, \find, 'name is "find"'
  (arr = [1])find (val, key, that)->
    assert.strictEqual @, ctx
    assert.strictEqual val, 1
    assert.strictEqual key, 0
    assert.strictEqual that, arr
  , ctx = {}
  assert.strictEqual [1 3 NaN, 42 {}]find((is 42)), 42
  assert.strictEqual [1 3 NaN, 42 {}]find((is 43)), void
  if !(-> @)!
    assert.throws (-> Array::find.call null, 0), TypeError
    assert.throws (-> Array::find.call void, 0), TypeError
  assert.ok \find of Array::[Symbol.unscopables], 'In Array#@@unscopables'