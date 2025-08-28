# Automated Jekyll Sync Setup Guide

This guide will help you set up automatic synchronization of your Budapest housing analysis to your Jekyll site whenever you update the finance repository.

## 🎯 Overview

The system works as follows:
1. You update `budapest-housing-analysis.md` or `charts.js` in your finance repository
2. GitHub Action automatically detects the changes
3. Action syncs the updated content to your Jekyll repository
4. Vercel automatically builds and deploys the updated site
5. Your analysis is live at `https://samu.space/2024/08/28/budapest-housing-analysis/`

## 🔧 Setup Steps

### Step 1: Configure GitHub Secrets

In your **finance repository** (this repo), go to:
- Settings → Secrets and variables → Actions
- Add the following repository secret:

**Secret Name:** `JEKYLL_REPOSITORY`
**Secret Value:** `samuelbalogh/samuelbalogh.github.io` (or your Jekyll repo name)

### Step 2: Configure Repository Permissions

In your **finance repository**, go to:
- Settings → Actions → General
- Under "Workflow permissions", select:
  - ✅ "Read and write permissions"
  - ✅ "Allow GitHub Actions to create and approve pull requests"

### Step 3: Verify Jekyll Repository Access

Ensure your Jekyll repository allows actions from other repositories:
- In your **Jekyll repository**, go to:
- Settings → Actions → General
- Under "Workflow permissions", ensure:
  - ✅ "Read and write permissions" is selected

### Step 4: Test the Automation

1. Make a small change to `budapest-housing-analysis.md`
2. Commit and push to your finance repository
3. Go to the "Actions" tab in your finance repository
4. You should see the "Sync Budapest Analysis to Jekyll" workflow running
5. Check your Jekyll repository for the auto-committed changes
6. Vercel should automatically build and deploy

## 📁 File Structure

After setup, your Jekyll repository will have:

```
samuelbalogh.github.io/
├── _posts/
│   └── 2024-08-28-budapest-housing-analysis.md  # Auto-synced
├── assets/
│   ├── js/
│   │   └── budapest-charts.js                   # Auto-synced
│   └── css/
│       └── budapest-analysis.css                # Auto-created
├── finance/
│   └── index.html                               # Auto-created
└── backups/
    └── YYYYMMDD_HHMMSS/                         # Auto-created
```

## 🔄 Workflow Triggers

The GitHub Action will automatically run when you push changes to:
- `budapest-housing-analysis.md`
- `charts.js`
- `index.html`

You can also manually trigger it from the Actions tab.

## 📊 What Gets Synced

### ✅ Automatically Synced:
- **Analysis Content**: Full markdown with 2025 data and inner districts focus
- **Charts**: Interactive Chart.js visualizations with 2025 data
- **CSS Styles**: Responsive styling for charts
- **Finance Section**: Landing page for finance analysis
- **Metadata**: SEO tags, categories, and descriptions

### 🔄 Vercel Integration:
- Automatic build and deployment
- Live at: `https://samu.space/2024/08/28/budapest-housing-analysis/`
- Finance section at: `https://samu.space/finance/`

## 🛠️ Troubleshooting

### Action Fails to Run
- Check repository secrets are configured correctly
- Verify repository permissions are set to "Read and write"
- Ensure the Jekyll repository name is correct

### Changes Not Appearing
- Check the Actions tab for workflow status
- Verify the Jekyll repository received the commit
- Check Vercel build logs for any deployment issues

### JavaScript Errors
- The action validates JavaScript syntax before pushing
- Check the action logs for specific error messages

## 🎛️ Manual Override

If you need to manually sync:
1. Go to Actions tab in your finance repository
2. Click "Sync Budapest Analysis to Jekyll"
3. Click "Run workflow"

## 📈 Monitoring

### GitHub Actions Dashboard
- View workflow runs and logs
- Monitor sync frequency and success rate
- Debug any issues

### Vercel Dashboard
- Monitor build and deployment status
- View deployment logs
- Check site performance

## 🔒 Security Notes

- The action uses `GITHUB_TOKEN` for authentication
- Repository secrets are encrypted
- Only specified files trigger the workflow
- Backups are created before each sync

## 🚀 Next Steps

1. **Configure the secrets** as described above
2. **Test with a small change** to verify everything works
3. **Monitor the first few syncs** to ensure smooth operation
4. **Update your analysis** - it will automatically sync to your live site!

## 📞 Support

If you encounter issues:
1. Check the GitHub Actions logs for error messages
2. Verify all secrets and permissions are configured correctly
3. Test with a manual workflow trigger
4. Check Vercel build logs for deployment issues

---

**🎉 Congratulations!** Your Budapest housing analysis will now automatically sync to your Jekyll site whenever you update it. No more manual copying or deployment steps needed!
