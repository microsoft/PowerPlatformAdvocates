# Podcast Copilot with Azure OpenAI Service, .NET, and Power Platform

This workshop explores the integration of the Power Platform with advanced AI models to create a dynamic application inspired by Kevin Scott’s Microsoft Build 2023 demo (https://github.com/microsoft/podcastcopilot).

Make it easy to generate a social media post promoting a new episode of your podcast. Starting from a podcast URL, we journey through speech-to-text transcription to generate a transcript of the podcast, given that transcript, we perform guest identification and guest bio retrieval, followed by social media post generation with image creation, and finally, posting to LinkedIn from Power Apps or Copilot Studio. All powered by Azure OpenAI Service, .NET and the Power Platform!

## Agenda

### 👩🏾‍💻 Lab 0 - Setup your environment

This lab is all about setting up your environment. This is what you need to get started. Make sure to do this before starting the workshop.

🚀 [Setup your environment](./Lab0/README.md)

### 🤖 Lab 1  - Laying the Foundation: Azure OpenAI Service and Power Platform

In this lab, we're going to dive into the world of Azure OpenAI Service. We introduce the service, describe the models, and guide you through creating deployments. Setting the stage for seamless AI integration.

🚀 [Laying the Foundation: Azure OpenAI Service and Power Platform](./Lab1/README.md)

### 🔧 Lab 2 - Bridging the Gap: .NET APIs, Azure, and Custom Connectors

In this lab, we take a step further from Lab 1 by creating a .NET API using the .NET Azure OpenAI SDK and creating a Custom Connector from Visual Studio.

🚀 [Bridging the Gap: .NET APIs, Azure, and Custom Connectors](./Lab2/README.md)

### 📱 Lab 3 - The Final Touch: Power Apps and Microsoft Copilot Studio Integration

In this lab, we bring it all together. We will build the Power App UI, connect to the Custom Connector, and publish the social media post to LinkedIn. As a bonus, we will also see how to implement this workflow with Microsoft Copilot Studio.

🚀 [The Final Touch: Power Apps and Microsoft Copilot Studio Integration](./Lab3/README.md)