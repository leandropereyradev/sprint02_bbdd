db.createCollection("store", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "store",
      required: ["store_number", "name", "address", "phone", "mail"],
      properties: {
        store_number: { bsonType: "int" },
        name: { bsonType: "string" },
        address: { bsonType: "objectId" },
        phone: { bsonType: "string" },
        mail: { bsonType: "string" },
        orders: {
          bsonType: "array",
          items: { bsonType: "objectId" },
        },
        employees: {
          bsonType: "array",
          items: { bsonType: "objectId" },
        },
      },
    },
  },
});
