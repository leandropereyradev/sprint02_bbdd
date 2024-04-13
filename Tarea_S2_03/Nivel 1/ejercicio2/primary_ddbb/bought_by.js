db.createCollection("bought_by", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "bought_by",
      required: ["bought_by"],
      properties: {
        bought_by: {
          bsonType: "array",
          items: { bsonType: "objectId" },
        },
      },
    },
  },
});
