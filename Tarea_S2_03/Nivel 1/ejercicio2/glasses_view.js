db.createCollection('glasses', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'glasses',
      required: ['brand', 'frame_type', 'supplier', 'price'],
      properties: {
        brand: {
          bsonType: 'string'
        },
        frame_type: {
          enum: 'Plastic',
          'Metallic',
          'Floating'
        },
        supplier: {
          bsonType: 'object',
          title: 'object',
          required: ['nif', 'name', 'telephone', 'address'],
          properties: {
            nif: {
              bsonType: 'string'
            },
            name: {
              bsonType: 'string'
            },
            telephone: {
              bsonType: 'string'
            },
            fax: {
              bsonType: 'string'
            },
            address: {
              bsonType: 'object',
              title: 'object',
              required: ['street', 'number', 'door', 'zip_code', 'city', 'country'],
              properties: {
                street: {
                  bsonType: 'string'
                },
                number: {
                  bsonType: 'string'
                },
                door: {
                  bsonType: 'string'
                },
                zip_code: {
                  bsonType: 'string'
                },
                city: {
                  bsonType: 'string'
                },
                country: {
                  bsonType: 'string'
                }
              }
            }
          }
        },
        price: {
          bsonType: 'double'
        },
        client: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['name', 'telephone', 'email', 'register_date', 'address'],
            properties: {
              name: {
                bsonType: 'string'
              },
              telephone: {
                bsonType: 'int'
              },
              email: {
                bsonType: 'string'
              },
              register_date: {
                bsonType: 'date'
              },
              address: {
                bsonType: 'object',
                title: 'object',
                required: ['street', 'number', 'door', 'zip_code', 'city', 'country'],
                properties: {
                  street: {
                    bsonType: 'string'
                  },
                  number: {
                    bsonType: 'string'
                  },
                  door: {
                    bsonType: 'string'
                  },
                  zip_code: {
                    bsonType: 'string'
                  },
                  city: {
                    bsonType: 'string'
                  },
                  country: {
                    bsonType: 'string'
                  }
                }
              }
            }
          }
        }
      }
    }
  }
});
