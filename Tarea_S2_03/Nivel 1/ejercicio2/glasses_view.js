db.createCollection("glasses_view", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "glasses_view",
      required: ["glasses", "bought_by"],
      properties: {
        glasses: { bsonType: "objectId" },
        bought_by: {
          bsonType: "array",
          items: { bsonType: "objectId" },
        },
      },
    },
  },
});
