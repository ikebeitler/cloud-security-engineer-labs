# Identity Governance Lab — Stale Account Detection

This lab identifies **stale accounts** in Entra ID (Azure AD) using Microsoft Graph and PowerShell.  
Stale accounts are a major identity risk because they often:

- Belong to former employees
- Have outdated MFA methods
- Retain privileged roles
- Are overlooked during offboarding
- Become easy targets for attackers

This lab automates the detection of accounts that have not signed in within a defined threshold (default: 90 days).

---

## 🔍 What This Lab Demonstrates

- Identity lifecycle governance
- Microsoft Graph API usage
- PowerShell automation
- Exporting security reports
- Real-world IAM operational tasks

---

## 📁 Files Included

- `find-stale-accounts.ps1` — Main script
- `sample-output.csv` — Example report
- `README.md` — Documentation (this file)

---

## 🧠 Logic Used

The script:

1. Connects to Microsoft Graph  
2. Pulls all users  
3. Retrieves each user’s last sign-in timestamp  
4. Flags users who have not signed in for **90+ days**  
5. Exports a CSV report for governance teams  

---

## 🛠️ Requirements

- PowerShell 7+
- Microsoft Graph PowerShell SDK  
  Install with:
  ```powershell
  Install-Module Microsoft.Graph -Scope CurrentUser
    
