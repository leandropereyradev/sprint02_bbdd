db.createCollection("glasses", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "glasses",
      required: [
        "brand",
        "graduation",
        "frame_type",
        "frame_color",
        "glass_color",
        "price",
      ],
      properties: {
        brand: { bsonType: "objectId" },
        graduation: { bsonType: "objectId" },
        frame_type: { enum: ["float", "metalic", "plastic"] },
        frame_color: { bsonType: "string" },
        glass_color: { bsonType: "objectId" },
        price: { bsonType: "decimal" },
      },
    },
  },
});
