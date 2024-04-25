db.createCollection('client', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'client',
      required: ['name', 'address', 'telephone', 'email', 'register_date'],
      properties: {
        name: {
          bsonType: 'string'
        },
        address: {
          bsonType: 'object',
          title: 'object',
          required: ['street', 'number'],
          properties: {
            street: {
              bsonType: 'string'
            },
            number: {
              bsonType: 'int'
            },
            flat: {
              bsonType: 'string'
            },
            door: {
              bsonType: 'string'
            }
          }
        },
        telephone: {
          bsonType: 'string'
        },
        email: {
          bsonType: 'string'
        },
        register_date: {
          bsonType: 'timestamp'
        },
        last_shopping: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['glasses', 'date'],
            properties: {
              glasses: {
                bsonType: 'array',
                items: {
                  title: 'object',
                  required: ['brand', 'frame_type', 'price'],
                  properties: {
                    brand: {
                      bsonType: 'string'
                    },
                    graduation: {
                      bsonType: 'object',
                      title: 'object',
                      properties: {
                        right_eye: {
                          bsonType: 'double'
                        },
                        left_eye: {
                          bsonType: 'double'
                        }
                      }
                    },
                    glass_color: {
                      bsonType: 'object',
                      title: 'object',
                      properties: {
                        right_glass: {
                          bsonType: 'string'
                        },
                        left_glass: {
                          bsonType: 'string'
                        }
                      }
                    },
                    frame_type: {
                      enum:
                    },
                    price: {
                      bsonType: 'double'
                    }
                  }
                }
              },
              date: {
                bsonType: 'timestamp'
              }
            }
          }
        }
      }
    }
  }
});
