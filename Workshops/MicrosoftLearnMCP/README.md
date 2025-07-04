# 📖 Lab: Use the Microsoft Learn MCP Server in Microsoft Copilot Studio

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

1. Enter the **name** for the agent

    ```
    Learn Agent
    ```

1. Enter the **description** for the agent

    ```
    This agent will help users to answer their questions about Microsoft topics and discover random Microsoft Learn topics.
    ```

1. Enter **instructions** for the agent

    ```
    You are an agent that will support users in their learning journey. Users will ask you questions about topics, make sure to answer those questions in a concise manner.
    ```

    ![](./assets/configure-agent.png)

1. Select **Create**

    ![](./assets/create-agent.png)

Now the agent is created! In the following section we'll add a tool to the agent so that it can answer questions about Microsoft Learn content.

## 🛠️ Create a custom connector for the Microsoft Learn MCP Server

1. Select **Tools** in the menu

    ![](./assets/select-tools.png)

1. Add a tool by selecting **Add a tool**

    ![](./assets/add-tool.png)

1. Select **New tool**

    ![](./assets/new-tool.png)

1. Select **Custom Connector**

    ![](./assets/custom-connector.png)

    This will open a new tab in your browser. It will show you the Power Apps portal where you can add a custom connector.

1. Select **New custom connector** (1) 
1. Select **Import from Github** (2)

    ![](./assets/new-custom-connector.png)

    This will open a wizard where you can select the connector you want to import from Github. In this case we are going to import the MCP-Streamable-HTTP connector.

1. Select **Custom** under Connector Type
1. Select **dev** under branch
1. Select **MCP-Streamable-HTTP** under connector
1. Select **Continue**

    ![](./assets/import-from-github.png)

    This will import the Streamable HTTP MCP Connector from Github. This way we only have to add a few things, like the name, the description and the URL.

1. Change the connector name to **Microsoft Learn MCP** (1)
1. Change the **description** to the following text (2)

    ```
    The Microsoft Docs MCP Server is a cloud-hosted service that enables MCP hosts to search and retrieve accurate information directly from Microsoft's official documentation.
    ```

1. Change the **Host** to the following URL (3)

    ```
    learn.microsoft.com
    ```

1. Change the **Base URL** to the following URL (4)

    ```
    /api/mcp
    ```

1. Select **Create connector** (5)

    ![](./assets/configure-connector.png)

1. Don't worry about the warning you'll see in the next step

    ![](./assets/warning.png)

1. Close the tab to go back to the Copilot Studio agent we created before
1. Select **Refresh** to be able to find the connector we just created

    ![](./assets/refresh.png)

1. Select the **Model Context Protocol** filter (1)
1. Select the tool **MCP Server Streamable HTTP** from the Microsoft Learn MCP connector (2)

    ![](./assets/add-tool-to-agent.png)

    It might be that the tool is not available yet - make sure to wait a little while and refresh again.

1. Next, you have to add a connection, do this by selecting (1) the **arrow down** and selecting (2) **Create new connection**

    ![](./assets/create-connection.png)

1. Select **Create** to create the connection

    ![](./assets/create-connection-create.png)

1. Select **Add to agent** to add the MCP Server to your agent

    ![](./assets/add-to-agent.png)

    Now the tool gets added to the agent.

1. Select the name of the tool **MCP Server Streamable HTTP**

    Now we need to make sure it's using the right connection and not that it's asking the user every time for a connection. This is something you can do for no authentication tools like this. If you have an MCP Server that requires user authentication, don't do the same.

    ![](./assets/select-mcp-tool.png)

1. Select **Additional details** to expand the details (1)
1. Change **Authentication** from **User authentication** to **Agent author authentication** (2)
1. Select **Save** to save the changes (3)

    ![](./assets/change-auth.png)

Now you are ready to test the Microsoft Learn MCP server! 🚀 

## 🧪 Test if the MCP Server is giving the right answers

1. Lets ask about Data Loss Prevention in Power Platform by entering the following prompt:

    ```
    Can you tell me what Data Loss Prevention is in the Power Platform?
    ```

1. In the following screenshot you can see **(1)** the activity map button which you need to click to enable the activity map, **(2)** this is how your MCP server will show in the activity map, you can see which tool got triggered, what it sent to the server (inputs) and **(3)** what it got back from the server. **(4)** shows how the output is formatted in the test agent experience.

    ![](./assets/output.png)

1. Lets try out another prompt and ask for this:

    ```
    Can you tell me more about MCP in Copilot Studio?
    ```

## 📖 More learning

- [Microsoft Copilot Studio ❤️ MCP Lab](https://aka.ms/mcsmcp/lab)
- [Microsoft Learn MCP Server](https://github.com/microsoftdocs/mcp)
