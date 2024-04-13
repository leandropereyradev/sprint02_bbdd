db.createCollection("pizza", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "pizza",
      required: ["name", "description"],
      properties: {
        name: { bsonType: "string" },
        description: { bsonType: "string" },
      },
    },
  },
});
