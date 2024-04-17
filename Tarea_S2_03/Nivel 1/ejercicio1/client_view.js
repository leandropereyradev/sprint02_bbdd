db.createCollection("client_view", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "client_view",
      required: ["customer", "last_shopping"],
      properties: {
        customer: { bsonType: "objectId" },
        last_shopping: { bsonType: "objectId" },
      },
    },
  },
});