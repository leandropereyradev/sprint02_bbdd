db.createCollection('store', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'store',
      required: ['name'],
      properties: {
        name: {
          bsonType: 'string'
        },
        order: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['take_away', 'item', 'total_price', 'date'],
            properties: {
              take_away: {
                bsonType: 'object',
                title: 'object',
                required: ['take_away'],
                properties: {
                  take_away: {
                    bsonType: 'bool'
                  },
                  client: {
                    bsonType: 'object',
                    title: 'object',
                    required: ['name', 'lastname', 'telephone', 'address'],
                    properties: {
                      name: {
                        bsonType: 'string'
                      },
                      lastname: {
                        bsonType: 'string'
                      },
                      telephone: {
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
                            bsonType: 'string'
                          },
                          floor: {
                            bsonType: 'string'
                          },
                          door: {
                            bsonType: 'string'
                          }
                        }
                      }
                    }
                  },
                  delivey_driver: {
                    bsonType: 'object',
                    title: 'object',
                    required: ['employee_id', 'name', 'lastname'],
                    properties: {
                      employee_id: {
                        bsonType: 'string'
                      },
                      name: {
                        bsonType: 'string'
                      },
                      lastname: {
                        bsonType: 'string'
                      }
                    }
                  }
                }
              },
              item: {
                bsonType: 'array',
                items: {
                  title: 'object',
                  required: ['type', 'quantity', 'price'],
                  properties: {
                    type: {
                      enum:
                    },
                    quantity: {
                      bsonType: 'int'
                    },
                    pizza_category: {
                      enum:
                    },
                    price: {
                      bsonType: 'double'
                    }
                  }
                }
              },
              total_price: {
                bsonType: 'double'
              },
              additional_infomation: {
                bsonType: 'string'
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