db.createCollection("last_shopping", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "last_shopping",
      required: ["sales"],
      properties: {
        sales: {
          bsonType: "array",
          items: { bsonType: "objectId" },
        },
      },
    },
  },
});
