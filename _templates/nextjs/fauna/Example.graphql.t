---
to: components/Example.graphql
---
query FindExample($id: ID!) {
  findExampleByID(id: $id) {
    _id
  }
}
