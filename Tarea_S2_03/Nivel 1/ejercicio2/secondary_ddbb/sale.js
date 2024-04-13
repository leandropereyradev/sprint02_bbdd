db.createCollection("sale", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "sale",
      required: ["customer", "glasses", "sale_date"],
      properties: {
        customer: { bsonType: "objectId" },
        glasses: { bsonType: "objectId" },
        sale_date: { bsonType: "timestamp" },
      },
    },
  },
});
