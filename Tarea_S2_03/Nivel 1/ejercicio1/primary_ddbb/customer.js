db.createCollection("customer", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "customer",
      required: [
        "name",
        "lastname",
        "address",
        "phone",
        "mail",
        "employee",
        "registration_date",
      ],
      properties: {
        name: { bsonType: "string" },
        lastname: { bsonType: "string" },
        address: { bsonType: "objectId" },
        phone: { bsonType: "string" },
        mail: { bsonType: "string" },
        employee: { bsonType: "objectId" },
        recommended: { bsonType: "objectId" },
        registration_date: { bsonType: "timestamp" },
      },
    },
  },
});
