---
to: components/withApollo.tsx
---
import withApollo from "next-with-apollo";
import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider,
  NormalizedCacheObject,
} from "@apollo/client";

const { NEXT_PUBLIC_FAUNA_CLIENT_KEY } = process.env;
if (!NEXT_PUBLIC_FAUNA_CLIENT_KEY) throw new Error('NEXT_PUBLIC_FAUNA_CLIENT_KEY is not defined. It must be defined with a valid Fauna API key.')

export const createApolloClient = (
  { initialState } = { initialState: null }
): ApolloClient<NormalizedCacheObject> => {
  return new ApolloClient({
    uri: "https://graphql.fauna.com/graphql",
    cache: new InMemoryCache().restore(initialState || {}),
    headers: {
      Authorization: `Bearer ${NEXT_PUBLIC_FAUNA_CLIENT_KEY}`,
    },
  });
};

export default withApollo(createApolloClient, {
  render: ({ Page, props }) => {
    return (
      <ApolloProvider client={props.apollo}>
        <Page {...props} />
      </ApolloProvider>
    );
  },
});