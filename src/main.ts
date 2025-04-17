import { app, BrowserWindow, ipcMain } from 'electron';
import path from 'path';
import { spawn } from 'child_process';

function createWindow() {
  const mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false
    }
  });

  mainWindow.loadFile(path.join(__dirname, '../index.html'));

  // Open DevTools by default
  mainWindow.webContents.openDevTools();
}

// Handle launching any program
ipcMain.handle('launch-program', async (_, programPath: string) => {
  return new Promise((resolve, reject) => {
    const program = spawn(programPath);
    let output = '';

    program.stdout.on('data', (data) => {
      output += data.toString();
    });

    program.stderr.on('data', (data) => {
      output += data.toString();
    });

    program.on('close', (code) => {
      if (code === 0) {
        resolve(output);
      } else {
        reject(new Error(`Program exited with code ${code}`));
      }
    });

    program.on('error', (err) => {
      reject(err);
    });
  });
});

app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
    }
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});