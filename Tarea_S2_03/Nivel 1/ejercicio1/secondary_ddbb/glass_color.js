db.createCollection("glass_color", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "glass_color",
      required: ["right_glass", "left_glass"],
      properties: {
        right_glass: { bsonType: "string" },
        left_glass: { bsonType: "string" },
      },
    },
  },
});
