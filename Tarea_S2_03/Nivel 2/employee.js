db.createCollection("employee", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "employee",
      required: [
        "name",
        "lastname",
        "address",
        "phone",
        "mail",
        "nif",
        "role",
        "store",
        "registration_date",
      ],
      properties: {
        name: { bsonType: "string" },
        lastname: { bsonType: "string" },
        address: { bsonType: "objectId" },
        phone: { bsonType: "string" },
        mail: { bsonType: "string" },
        nif: { bsonType: "string" },
        role: { enum: ["cook", "delivery"] },
        store: { bsonType: "objectId" },
        registration_date: { bsonType: "timestamp" },
      },
    },
  },
});
