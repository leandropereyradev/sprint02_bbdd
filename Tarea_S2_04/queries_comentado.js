// 1. Escribe una consulta para mostrar todos los documentos en la colección Restaurantes.
db.restaurants.find();

// 2. Escribe una consulta para mostrar restaurante_id, name, borough y cuisine
//    para todos los documentos en la colección Restaurantes.
db.restaurants.find({}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 });

// 3. Escribe una consulta para mostrar restaurante_id, name, borough y cuisine,
//    pero excluye el campo _id para todos los documentos en la colección Restaurantes.
db.restaurants.find(
  {},
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
);

// 4. Escribe una consulta para mostrar restaurant_id, name, borough y zip code, pero
//    excluye el campo _id para todos los documentos en la colección Restaurantes.
db.restaurants.find(
  {},
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1 }
);

// 5. Escribe una consulta para mostrar todos los restaurantes que están en el Bronx.
db.restaurants.find({ borough: "Bronx" });

// 6. Escribe una consulta para mostrar los primeros 5 restaurantes que están en el Bronx.
db.restaurants.find({ borough: "Bronx" }).limit(5);

// 7. Escribe una consulta para mostrar el próximo 5 restaurantes después de saltar
//    los primeros 5 del Bronx.
db.restaurants.find({ borough: "Bronx" }).skip(5);

// 8. Escribe una consulta para encontrar los restaurantes que tienen un score de más de 90.
db.restaurants.find({ "grades.score": { $gt: 90 } });

// 9. Escribe una consulta para encontrar los restaurantes que tienen un score de más de 80
//    pero menos que 100.
db.restaurants.find({ "grades.score": { $gt: 80, $lt: 100 } });

// 10. Escribe una consulta para encontrar a los restaurantes que se localizan en valor
//     de latitud menos de -95.754168.
db.restaurants.find({ "address.coord.0": { $lt: -95.754168 } });

// 11. Escribe una consulta de MongoDB para encontrar los restaurantes que no preparan
//     ninguna cuisine de 'American' y su calificación es superior a 70 y longitud inferior
//     a -65.754168.
db.restaurants.find({
  $and: [
    { cuisine: { $ne: "American" } },
    { "grades.score": { $gt: 70 } },
    { "address.coord.0": { $lt: -65.754168 } },
  ],
});

// 12. Escribe una consulta para encontrar a los restaurantes que no preparan ninguna cuisine
//     de 'American' y consiguieron un marcador más de 70 y localizado en la longitud menos que
//     -65.754168. Nota : Realiza esta consulta sin utilizar $and operador.
db.restaurants.find({
  cuisine: { $ne: "American" },
  "grades.score": { $gt: 70 },
  "address.coord.1": { $lt: -65.754168 },
});

// 13. Escribe una consulta para encontrar a los restaurantes que no preparan ninguna cuisine
//     de 'American' y obtuvieron un punto de grado 'A' no pertenece a Brooklyn. Se debe mostrar
//     el documento según la cuisine en orden descendente.
db.restaurants
  .find({
    cuisine: { $ne: "American" },
    "grades.grade": "A",
    borough: { $ne: "Brooklyn" },
  })
  .sort({ cuisine: -1 });

// 14. Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos
//     restaurantes que contienen 'Wil' como las tres primeras letras en su nombre.
db.restaurants.find(
  { name: /^Wil/i },
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
);

// 15. Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos
//     restaurantes que contienen 'ces' como las últimas tres letras en su nombre.
db.restaurants.find(
  { name: /ces$/i },
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
);

// 16. Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos
//     restaurantes que contienen 'Reg' como tres letras en algún sitio en su nombre.
db.restaurants.find(
  { name: /Reg/i },
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
);

// 17. Escribe una consulta para encontrar los restaurantes que pertenecen al Bronx y prepararon
//     cualquier plato americano o chino.
db.restaurants.find({
  borough: "Bronx",
  $or: [{ cuisine: "American" }, { cuisine: "Chinese" }],
});

// 18. Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos
//     restaurantes que pertenecen a Staten Island o Queens o Bronx o Brooklyn.
db.restaurants.find(
  {
    borough: { $in: ["Staten Island", "Queens", "Bronx", "Brooklyn"] },
  },
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
);

// 19. Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos
//     restaurantes que no pertenecen a Staten Island o Queens o Bronx o Brooklyn.
db.restaurants.find(
  {
    borough: { $nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"] },
  },
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
);

// 20. Escribe una consulta para encontrar restaurante_id, name, borough y cuisine para aquellos
//     restaurantes que consigan un marcador que no es más de 10.
db.restaurants.find(
  {
    "grades.score": { $not: { $gt: 10 } },
  },
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
);

// 21. Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos
//     restaurantes que preparan pescado excepto 'American' y 'Chinees' o el name del restaurante
//     comienza con letras 'Wil'.
db.restaurants.find(
  {
    $or: [
      {
        cuisine: "Fish",
        cuisine: { $nin: ["American", "Chinese"] },
      },
      {
        name: /^Wil/,
      },
    ],
  },
  {
    _id: 0,
    restaurant_id: 1,
    name: 1,
    borough: 1,
    cuisine: 1,
  }
);

// 22. Escribe una consulta para encontrar el restaurant_id, name, y gradas para aquellos restaurantes
//     que consigan un grado "A" y un score 11 en datos de estudio ISODate "2014-08-11T00:00:00Z".
db.restaurants.find(
  {
    grades: {
      $elemMatch: {
        grade: "A",
        score: 11,
        date: ISODate("2014-08-11T00:00:00Z"),
      },
    },
  },
  {
    _id: 0,
    restaurant_id: 1,
    name: 1,
    grades: 1,
  }
);

// 23. Escribe una consulta para encontrar el restaurante_id, name y gradas para aquellos restaurantes
//     donde el 2º elemento de variedad de grados contiene un grado de "A" y marcador 9 sobre un
//     ISODate "2014-08-11T00:00:00Z".
db.restaurants.find(
  {
    grades: {
      $elemMatch: {
        $and: [
          { grade: "A" },
          { score: 9 },
          { date: ISODate("2014-08-11T00:00:00Z") },
        ],
      },
    },
  },
  {
    _id: 0,
    restaurant_id: 1,
    name: 1,
    grades: {
      $elemMatch: {
        grade: "A",
        score: 9,
        date: ISODate("2014-08-11T00:00:00Z"),
      },
    },
  }
);

// 24. Escribe una consulta para encontrar el restaurante_id, name, dirección y ubicación geográfica
//     para aquellos restaurantes en los que el segundo elemento del array coord contiene un valor que
//     es más de 42 y hasta 52.
db.restaurants.find(
  {
    "address.coord.1": { $gt: 42, $lt: 52 },
  },
  {
    _id: 0,
    restaurant_id: 1,
    name: 1,
    "address.street": 1,
    "address.coord": 1,
  }
);

// 25. Escribe una consulta para organizar el nombre de los restaurantes en orden ascendente junto
//     a todas las columnas.
db.restaurants.find().sort({ name: 1 });

// 26. Escribe una consulta para organizar el nombre de los restaurantes en orden descendente junto
//     a todas las columnas.
db.restaurants.find().sort({ name: -1 });

// 27. Escribe una consulta para organizar el nombre de la cuisine en orden ascendente y por el
//     mismo barrio de cuisine. Orden descendente.
db.restaurants.find().sort({ cuisine: 1, borough: -1 });

// 28. Escribe una consulta para saber todas las direcciones que no contienen la calle.
db.restaurants.find({ "address.street": { $exists: false } });

// 29. Escribe una consulta que seleccionará todos los documentos en la colección de restaurantes cuyo
//     valor del campo coord es Double.
db.restaurants.find({ "address.coord": { $type: "double" } });

// 30. Escribe una consulta que seleccionará el restaurante_id, name y grade para aquellos restaurantes
//     que devuelvan 0 como resto después de dividir el marcador por 7.
db.restaurants.find(
  {
    $expr: {
      $eq: [{ $mod: ["$grades.score", 7] }, 0],
    },
  },
  {
    _id: 0,
    restaurant_id: 1,
    name: 1,
    "grades.grade": 1,
  }
);

// 31. Escribe una consulta para encontrar el name de restaurante, borough, longitud y altitud y cuisine
//     para aquellos restaurantes que contienen 'mon' como tres letras en algún sitio de su nombre.
db.restaurants.find(
  { name: /mon/i },
  { _id: 0, name: 1, borough: 1, "address.coord": 1, cuisine: 1 }
);

// 32. Escribe una consulta para encontrar el name de restaurante, borough, longitud y latitud y cuisine
//     para aquellos restaurantes que contienen 'Mad' como primeras tres letras de su nombre.
db.restaurants.find(
  { name: /^Mad/i },
  { _id: 0, name: 1, borough: 1, "address.coord": 1, cuisine: 1 }
);
