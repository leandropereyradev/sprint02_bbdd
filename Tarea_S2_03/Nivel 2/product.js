db.createCollection("product", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "product",
      required: ["name", "description", "image", "price", "category"],
      properties: {
        name: { bsonType: "string" },
        description: { bsonType: "string" },
        image: { bsonType: "string" },
        price: { bsonType: "decimal" },
        category: { enum: ["hamburger", "beverage", "pizza"] },
        pizza: { bsonType: "objectId" },
      },
    },
  },
});
