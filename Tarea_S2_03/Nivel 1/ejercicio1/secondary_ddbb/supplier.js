db.createCollection("supplier", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "supplier",
      required: ["name", "address", "phone", "nif"],
      properties: {
        name: { bsonType: "string" },
        address: { bsonType: "objectId" },
        phone: { bsonType: "string" },
        fax: { bsonType: "string" },
        nif: { bsonType: "string" },
      },
    },
  },
});
