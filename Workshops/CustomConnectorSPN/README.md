# Lab: Use service principal auth for custom connectors

In this lab, you will learn how to use service principal auth for custom connectors. The Microsoft Graph API and in particularly the Invitation Manager is used for this lab. During this lab you will learn how to create a connector that contains only one action. This lab is focused on creating service principal support for custom connectors, so it's not about having a big connector with lots of actions.

## Learn about the API

When building a connector, the first thing that you need to do is read the docs. In this case, we are going to build a connector for the [Microsoft Graph API](https://aka.ms/graph). To be more specific, we are going to build a connector for the Invitation Manager. The Invitation Manager is an operation in the Microsoft Graph API that helps organizations manage their guest users. In the Microsoft ecosystem, it is possible to invite guest users to your organization and share certain assets with them. This could be a SharePoint site, OneDrive for Business documents or folders, but we can also share Power Apps or even give them the ability to make within the Power Platform.

To learn more about the Invitation Manager, go to the [API reference](https://aka.ms/invitationmanager) on the Microsoft Graph learn website. On this page, you can read more about what the operation does, what the methods, properties and relationships are. In most cases, there also is a JSON representation of the resource (like in this case, the invitation resource).

Again, learning about the API is one of the most important steps when you are building a connector. Knowing what the API does will benefit you in the rest of the process of building a connector massively.

## Create the connector

In this lab, we will start creating a connector from blank. This is something you can do in the maker portal.

1. Go to the Power Automate maker portal via [https:/make.powerautomate.com](https:/make.powerautomate.com)
1.
