# 📖 Use the Microsoft Learn MCP Server in Microsoft Copilot Studio

The Microsoft Learn team announced the [Microsoft Learn MCP Server](https://github.com/microsoftdocs/mcp). Since this MCP Server is not yet available out of the box, lets explore how you can add this to Microsoft Copilot Studio!

## ⚙️ Prerequisites

- Microsoft Copilot Studio trial or developer account
- Have an environment available in your tenant without any Data Loss Prevention rules that could block the new custom connector that gets created in this lab

## 🤖 Create an agent in Microsoft Copilot Studio

1. Go to [Microsoft Copilot Studio](https://copilotstudio.microsoft.com)
1. Select **Create**

    ![](./assets/create.png)

1. Select **New agent**

    ![](./assets/new-agent.png)

1. Select **Skip to configure**

    ![](./assets/skip-to-configure.png)

1. Enter the name for the agent

    ```Learn Agent```

1. Enter the description for the agent

    ```This agent will help users to answer their questions about Microsoft topics and discover random Microsoft Learn topics.```

1. Enter instructions for the agent

    ```You are an agent that will support users in their learning journey. Users will ask you questions about topics, make sure to answer those questions in a concise manner.```

    ![](./assets/configure-agent.png)

1. Select **Create**

    ![](./assets/create-agent.png)

Now the agent is created! In the following section we'll add a tool to the agent so that it can answer questions about Microsoft Learn content.

## 🛠️ Create a custom connector for the Microsoft Learn MCP Server

1. Lets ask about Data Loss Prevention in Power Platform by entering the following prompt:

    ```Can you tell me what Data Loss Prevention is in the Power Platform?```

1. In the following screenshot you can see 1) the activity map button which you need to click to enable the activity map, 2) this is how your MCP server will show in the activity map, you can see which tool got triggered, what it sent to the server (inputs) and 3) what it got back from the server. 4) shows how the output is formatted in the test agent experience.

    ![](./assets/output.png)

1. Lets try out another prompt and ask for this:

    ```Can you tell me more about MCP in Copilot Studio?```