package graphqlInterface;

public const string TOKEN = "0ca0c36ece9e48bf816e16de4afbf6ef21c9a3b2";
public const string QUERY = string `query {
  organization(login:\\\"wso2\\\"){
        projects(last:30 states: OPEN){
          nodes{
            name
            columns(last:40){
              nodes{
                name
                cards(last:100){
                  nodes{
                    id
                    state
                    note

                    createdAt
                    updatedAt
                    content{
                      ... on Issue {
                       title
                       state
                       url
                      }

                    }
                    creator {
                      login

                    }

                   }
              }
            }
          }
        }
      }
    }
  }
`;
