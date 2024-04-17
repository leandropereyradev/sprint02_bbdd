db.createCollection("brand", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "brand",
      required: ["supplier", "brand"],
      properties: {
        supplier: { bsonType: "objectId" },
        brand: { bsonType: "string" },
      },
    },
  },
});