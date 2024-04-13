db.createCollection("order", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "order",
      required: [
        "datetime",
        "delivery_type",
        "products",
        "total_price",
        "customer",
        "store",
      ],
      properties: {
        datetime: { bsonType: "date" },
        delivery_type: { enum: ["delivery", "pickup"] },
        products: {
          bsonType: "array",
          items: { bsonType: "objectId" },
        },
        total_price: { bsonType: "decimal" },
        note: { bsonType: "string" },
        customer: { bsonType: "objectId" },
        store: { bsonType: "objectId" },
        delivery_person: { bsonType: "objectId" },
        delivery_datetime: { bsonType: "date" },
      },
    },
  },
});
