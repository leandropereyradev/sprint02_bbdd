db.createCollection("store", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "store",
      required: ["name", "address", "phone", "mail"],
      properties: {
        name: { bsonType: "string" },
        address: { bsonType: "objectId" },
        phone: { bsonType: "string" },
        mail: { bsonType: "string" },
      },
    },
  },
});
