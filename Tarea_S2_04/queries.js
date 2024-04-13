db.restaurants.find()
db.restaurants.find({},{restaurant_id:1,name:1,borough:1,cuisine:1})

db.restaurants.find({},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1})

db.restaurants.find({},{_id:0,restaurant_id:1,name:1,borough:1,"address.zipcode":1})

db.restaurants.find({borough:"Bronx"})

db.restaurants.find({borough:"Bronx"}).limit(5)

db.restaurants.find({borough:"Bronx"}).skip(5)

db.restaurants.find({"grades.score":{$gt:90}})

db.restaurants.find({"grades.score":{$gt:80,$lt:100}})

db.restaurants.find({"address.coord.0":{$lt:-95.754168}})

db.restaurants.find({$and:[{cuisine:{$ne:"American"}},{"grades.score":{$gt:70}},{"address.coord.0":{$lt:-65.754168}},]})

db.restaurants.find({cuisine:{$ne:"American"},"grades.score":{$gt:70},"address.coord.1":{$lt:-65.754168}})

db.restaurants.find({cuisine:{$ne:"American"},"grades.grade":"A",borough:{$ne:"Brooklyn"}}).sort({cuisine:-1})

db.restaurants.find({name:/^Wil/i},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1})

db.restaurants.find({name:/ces$/i},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1})

db.restaurants.find({name:/Reg/i},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1})

db.restaurants.find({borough:"Bronx",$or:[{cuisine:"American"},{cuisine:"Chinese"}]})

db.restaurants.find({borough:{$in:["Staten Island","Queens","Bronx","Brooklyn"]}},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1})

db.restaurants.find({borough:{$nin:["Staten Island","Queens","Bronx","Brooklyn"]}},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1})

db.restaurants.find({"grades.score":{$not:{$gt:10}}},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1})

db.restaurants.find({$or:[{cuisine:"Fish",cuisine:{$nin:["American","Chinese"]}},{name:/^Wil/},]},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1})

db.restaurants.find({grades:{$elemMatch:{grade:"A",score:11,date:ISODate("2014-08-11T00:00:00Z")}}},{_id:0,restaurant_id:1,name:1,grades:1})

db.restaurants.find({grades:{$elemMatch:{$and:[{grade:"A"},{score:9},{date:ISODate("2014-08-11T00:00:00Z")},]}}},{_id:0,restaurant_id:1,name:1,grades:{$elemMatch:{grade:"A",score:9,date:ISODate("2014-08-11T00:00:00Z")}}})

db.restaurants.find({"address.coord.1":{$gt:42,$lt:52}},{_id:0,restaurant_id:1,name:1,"address.street":1,"address.coord":1})

db.restaurants.find().sort({name:1})

db.restaurants.find().sort({name:-1})

db.restaurants.find().sort({cuisine:1,borough:-1})

db.restaurants.find({"address.street":{$exists:!1}})

db.restaurants.find({"address.coord":{$type:"double"}})

db.restaurants.find({$expr:{$eq:[{$mod:["$grades.score",7]},0]}},{_id:0,restaurant_id:1,name:1,"grades.grade":1})

db.restaurants.find({name:/mon/i},{_id:0,name:1,borough:1,"address.coord":1,cuisine:1})

db.restaurants.find({name:/^Mad/i},{_id:0,name:1,borough:1,"address.coord":1,cuisine:1});
