db.createCollection("address", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "address",
      required: ["street", "number", "zip_code", "city", "country"],
      properties: {
        street: { bsonType: "string" },
        number: { bsonType: "string" },
        flat: { bsonType: "string" },
        door: { bsonType: "string" },
        zip_code: { bsonType: "string" },
        city: { bsonType: "string" },
        country: { bsonType: "string" },
      },
    },
  },
});
