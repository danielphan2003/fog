{
  description = "An opinionated way of updating nixpkgs source.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.std.url = "github:divnix/std";
  inputs.std.inputs.nixpkgs.follows = "nixpkgs";

  outputs = {
    self,
    std,
    ...
  } @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./cells;
      cellBlocks = [
        (std.runnables "cli")
        (std.runnables "repl")

        (std.functions "lib")
        (std.functions "categories")

        (std.functions "all-packages")
        (std.functions "minecraft-mods")
        (std.functions "papermc")
        (std.functions "open-vsx")
        (std.functions "vsmarketplace")
        (std.functions "vscode-extensions")

        (std.functions "devshellProfiles")
        (std.devshells "devshells")
      ];
    } {
      devShells = std.harvest self ["automation" "devshells"];
    };

  # --- Flake Local Nix Configuration ----------------------------
  # TODO: adopt spongix
  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://fog.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "fog.cachix.org-1:FAxiA6qMLoXEUdEq+HaT24g1MjnxdfygrbrLDBp6U/s="
    ];
  };
  # --------------------------------------------------------------
}
# Bank Card Distribution Management System
## Introduction
This is a prototype / proof-of-concept app for a Fintech company that services customers
in developing markets. This market is characterised by companies not having formal agreements
or relationships with their customers. For this reason, the company wishes to introduce, what
can be characterised as, a more conventional bank card which will allow their customers to access
their suite of products.
The distribution of these bank cards to end users is done via an informal network of sales agents
(or resellers). The company's back office team receives bundles of bank cards from their supplier.
Each bank card has a unique number, but unlike traditional bank cards, they are not yet allocated
to a customer. Each bundle also has a unique number and, is in turn, linked to the set of unique 
bank cards that make up that bundle.
The back office team releases bundles of cards to their first line of sales agents i.e. the agents
that they have a direct relationship with. These agents in turn distribute (or transfer) these 
bundles to their own network of sub-agents. Sub agents may in turn sign-up their own
network of agents and transfer bundles to them, thus forming a hierarchy.
Any agent can then sign-up a customer by selling them a bank card for a nominal, pre-determined 
fee. This fee is the agent's remuneration. The transfer of bundles between agents may be 
accompanied by a financial transaction between agents (as the bundles do have a monetary value), 
but this is of no consequence or interest to the company. They are only interested that the 
customer pays the pre-determined fee.
Each bank card is packaged with a set of instructions for activating the card. On activation
of the card, and validation of the customer's details, the back office team can then reconcile
what the distribution network has reported vs the actual customer on-boarding. 
Lastly, bundles are distributed as part of a campaign. The company wishes to be able to track
the progress of a campaign with regards to the number of cards that have been allocated as well
as the performance of their first tier sales agents.
## Requirements
The company has a requirement to purchase/build a distribution management system of bank cards 
that allows for the following functions:
### Back office team
 
* Create and manage campaigns.
* Load bundles of cards onto the system and assign them to campaigns.
* Create accounts for sales agents (users) that they have direct relationship with.
* Users must activate their own accounts on receipt of an activation / invitation SMS or email. 
* Users can be uniquely identified by either a mobile number or email. The vast majority will 
  most likely use a mobile number.
* Release (assign) bundles to the first tier of sales agents.
* Have a dashboard view of how a campaign is performing.
* Detailed reporting of a campaign including breakdown by sales agent (and that sales agent's network).
* Recording and linking of unique card numbers during the loading of bundles.   
* Report to enable reconciliation of the activation of cards to the sale of the card as 
  recorded by the sales agent.
Additionally there are some further requirements related to ease-of-use (UX).
* Capture of bundles to be managed via scanning of a barcode or QR code (specifications to be
  provided by the supplier of the cards).
 
### Sales agent network
* Create and manage user accounts for sub agents. Users must activate their own accounts 
  on receipt of an activation / invitation SMS or email.
* Be able to perform the following bundle actions:
  * Record a sale to a customer, as a simple transaction that captures the quantity of 
    cards sold.
  * Transfer an entire bundle to an agent in their network.
  * Transfer an entire bundle to an agent outside of their network.
* Once unique cards are being tracked then:
  * Record a sale by indicating which uniquely identified card has actually been sold.
  * Transfer a part bundle to an agent in their network .
  * Transfer a part bundle to an agent outside of their network.
* Be able to return a bundle (entire or partial) to the back office.
* Overview dashboard of their network's performance.
Additionally there are some further requirements related to ease-of-use (UX). Sales agents
will have access to some basic smart phones, so a mobile app (or mobile-first web page) is
a requirement for them to be able to transact in the field. 
* Prototype a mobile UX for the sales agent. 
* Capture of bundles to be managed via scanning of a barcode or QR code.
### Reporting
* All bundle transactions (load, release, transfers, sale) must be recorded.
* All user lifecycle stages (create, activate, login, delete) should be recorded.
* All card transactions (load, sale) must be recorded.
## Phases  
In general terms the prototype may be created in the phases below. 
### Phase 1 
Build out a webapp that has both back office and agent portals and encompasses the main
business models in order to validate the general work flow and model design:
   
#### Back office
* Create campaigns.
* Create user accounts and allow users to activate (email only) and sign-up.  
* Load and release bundles to agents.
* Have an overview dashboard of campaigns.
* Track bundle transactions
#### Agent portal
* Create user accounts in order to build up a network.
* Record a sale.
* Transfer bundle to a sub-agent.
* Simple transfer of a partial bundle to a sub-agent (implemented as a simply 
* Simple transfer of a partial bundle to a sub-agent (implemented as simply 
  splitting a bundle and recording quantities).
* Track bundle transactions.

### Phase 2
* Activation via SMS.
* Prototyping around the use of barcode / QR code scanning to scan in bundles.
* Building out of the mobile app or mobile web page to implement scanning.  
* Recognising the individual cards:
  * on loading of the bundle
  * during transfers of partial bundles
  * at time of sale to the customer.
  
#### Agent portal
* Dashboard views of their network's performance.
  
### Phase 3
* Reporting on performance at the campaign, agent, and network levels.
* Reconciliation reporting between on-boarding systems and this system.
