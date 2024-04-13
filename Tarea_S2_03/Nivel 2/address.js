db.createCollection("address", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "address",
      required: ["street", "number", "postal_code", "city", "country"],
      properties: {
        street: { bsonType: "string" },
        number: { bsonType: "string" },
        flat: { bsonType: "string" },
        door: { bsonType: "string" },
        postal_code: { bsonType: "string" },
        city: { bsonType: "string" },
        country: { bsonType: "string" },
      },
    },
  },
});
