db.createCollection("graduation", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "graduation",
      required: ["left_eye", "right_eye"],
      properties: {
        left_eye: { bsonType: "decimal" },
        right_eye: { bsonType: "decimal" },
      },
    },
  },
});
