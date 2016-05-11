    %close windows
    close all; 
    
    %Preallocate buffer
    data_att = zeros(1,256); 
    data_raw = zeros(1,1024);
    data_rawf = zeros(500,310);
    
    %Zero vars
    j=0;
    l=0;
    
    %COM Port define !!YOU NEED TO DEFINE COM PORT FOR YOUR EEG DEVICE
    %BEFORE RUNNING THIS PROGRAM!!
    portnum1 = 9;  
    
    %COM Port # 
    comPortName1 = sprintf('\\\\.\\COM%d', portnum1);

    %Set rate
    TG_BAUD_115200  =   115200;

    %Data stream format 
    TG_STREAM_PACKETS =     0;
    
    %Data type 
    TG_DATA_RAW = 4;
    
    %load thinkgear dll
    loadlibrary('Thinkgear.dll','thinkgear.h') 

    %Get a connection ID handle to ThinkGear
    connectionId1 = calllib('Thinkgear', 'TG_GetNewConnectionId');
    if ( connectionId1 < 0 )
        error( sprintf( 'ERROR: TG_GetNewConnectionId() returned %d.\n', connectionId1 ) );
    end;
    
    %Connect via ComPort
    errCode = calllib('Thinkgear', 'TG_Connect',  connectionId1,comPortName1,TG_BAUD_115200,TG_STREAM_PACKETS );
    if ( errCode < 0 )
        error( sprintf( 'ERROR: TG_Connect() returned %d.\n', errCode ) );
    end

    %Status update
    disp('starting to record EEG waves')

    figure;
    
    while l < 3
        
        %zero vars
        data_raw = zeros(1,1024);
        k = 0;
        i = 0;
        
    %Read for 2 second epochs    
    while i < 1024
        if (calllib('Thinkgear','TG_ReadPackets',connectionId1,1) == 1)   %if a packet was read...
            %Call upon data
            if (calllib('Thinkgear','TG_GetValueStatus',connectionId1,TG_DATA_RAW) ~= 0)
            k = k + 1;
            i = i + 1;
            data_raw(k)= calllib('Thinkgear','TG_GetValue',connectionId1,TG_DATA_RAW );
            %disp(data_raw(k));
            end
       end
    end
    
    %Update var
    l = l + 1;
    
    %Median Filter
    data_rawp = medfilt1(data_raw,3);
    data_rawf(:,l) = abs(fft(data_rawp,500));
    
    %Plotting Time
    plot(data_rawf(:,l))
    title('FFT graph of raw data over 2 seconds');
    
    %Call in Neural Network
    %y = sim(net3,data_rawf(:,l),[],[]);
    %disp(y);
    
    %Write to JSON
    %{
    file = fopen('G:\Google Science Fair 2016\Demo Website\JSON.php','wt');
    if (y < .5 && y > 0)
    z1 = '[{"activation": "';
    z2 = '1';
    z3 = '"}]';
    z = strcat(z1,z2,z3);
    fprintf(file,z);
    fclose(file);
    else
    z1 = '[{"activation": "';
    z2 = '0';
    z3 = '"}]';
    z = strcat(z1,z2,z3);
    fprintf(file,z);
    fclose(file);
    end
    %}
    
    %Debug Feedback
    pause(1)
    disp('tracker')  
    end
    
    %Release the comm port
    calllib('Thinkgear', 'TG_FreeConnection', connectionId1 );
    
    %Write to csv
    %{
    csvwrite('G:\Google Science Fair 2016\Demo Website\JSON.php', '[{"activation": "0"}]');
    disp('Loop Completed')
    disp('Writing data to csv');
    cd C:\Users\zhizh\OneDrive\Documents\MATLAB
    csvwrite('datasadr3.csv',data_rawf);
    disp('Writing finsihed');
    %}
    
    %Last word
    disp('bye')
    