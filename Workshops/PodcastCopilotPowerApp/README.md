# Podcast Copilot with Azure OpenAI Service, .NET, and Power Platform

This workshop explores the integration of the Power Platform with advanced AI models to create a dynamic application inspired by Kevin Scott’s Microsoft Build 2023 demo (https://github.com/microsoft/podcastcopilot).

Make it easy to generate a social media post promoting a new episode of your podcast:

* Starting from the podcast URL, you get the transcription with the **Whisper** model
* Given that transcript, you use **GPT** to extract the name of the guest
* With the guest name, you retrieve their bio with **Bing Search**
* With the transcription and the guest bio, you generate a social media blurb with **GPT**
* With the social media blurb, you generate a relevant DALL-E prompt with **GPT**
* Finally, you use **DALL-E** to generate an image for the social media post with the prompt

Then you'll learn how to surface this process in a Power App or through a copilot using Microsoft Copilot Studio all powered by Azure OpenAI Service, .NET and the Power Platform!

## Agenda

### 👩🏾‍💻 Lab 0 - Setup your environment

This lab is all about setting up your environment. This is what you need to get started. Make sure to do this before starting the workshop.

🚀 [Setup your environment](./Lab0/README.md)

### 🤖 Lab 1  - Laying the Foundation: Azure OpenAI Service

In this lab, we're going to dive into the world of Azure OpenAI Service. We introduce the service, describe the models, and guide you through creating deployments. Setting the stage for seamless AI integration.

🚀 [Laying the Foundation: Azure OpenAI Service and Power Platform](./Lab1/README.md)

### 🔧 Lab 2 - Bridging the Gap: .NET APIs and Custom Connectors

In this lab, we take a step further from Lab 1 by creating a .NET API using the .NET Azure OpenAI SDK and creating a Custom Connector from Visual Studio.

🚀 [Bridging the Gap: .NET APIs, Azure, and Custom Connectors](./Lab2/README.md)

### 📱 Lab 3 - The Final Touch: Power Apps and Microsoft Copilot Studio Integration

In this lab, we bring it all together. We will build the Power App UI, connect to the Custom Connector, and create the AI generated social media post. As a bonus, we will also see how to implement this workflow with Microsoft Copilot Studio as well.

🚀 [The Final Touch: Power Apps and Microsoft Copilot Studio Integration](./Lab3/README.md)

## Feedback

We hope that you'll find this content valuable and if you do, we'd love to hear your feedback! Please fill out our [feedback form](https://aka.ms/pp/advocates/feedback) so we can use your feedback to keep providing valuable content!